require 'pathname'
require 'fileutils'

namespace :hqmf do
  desc 'Convert a HQMF file to JavaScript'
  task :convert, [:hqmf,:hqmf_version] do |t, args|
    
    raise "The path to the the hqmf xml must be specified" unless args.hqmf
    
    FileUtils.mkdir_p File.join(".","tmp",'js')
    file = File.expand_path(args.hqmf)
    version = args.hqmf_version || HQMF::Parser::HQMF_VERSION_1
    filename = Pathname.new(file).basename
    doc = HQMF::Parser.parse(File.open(file).read, version)
    
    gen = HQMF2JS::Generator::JS.new(doc)

    out_file = File.join(".","tmp",'js',"#{filename}.js")
    
    File.open(out_file, 'w') do |f| 

      f.write("// #########################\n")
      f.write("// ##### DATA CRITERIA #####\n")
      f.write("// #########################\n\n")
      f.write(gen.js_for_data_criteria())      
      
      f.write("// #########################\n")
      f.write("// ##### POPULATION CRITERIA #####\n")
      f.write("// #########################\n\n")
           
      f.write("// INITIAL PATIENT POPULATION\n")
      f.write(gen.js_for('IPP'))
      f.write("// DENOMINATOR\n")
      f.write(gen.js_for('DENOM'))
      f.write("// NUMERATOR\n")
      f.write(gen.js_for('NUMER'))
      f.write("// EXCLUSIONS\n")
      f.write(gen.js_for('EXCL'))
      f.write("// DENOMINATOR EXCEPTIONS\n")
      f.write(gen.js_for('DENEXCEP'))
    end
    
    puts "wrote javascript to: #{out_file}"
    
  end
end
    