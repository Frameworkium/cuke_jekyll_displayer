require 'gherkin/parser'
parser = Gherkin::Parser.new

Dir.glob("**/*.feature") {|filename|
  in_path = File.expand_path(File.dirname(__FILE__) + "/" + filename)
  doc = parser.parse(IO.read(in_path))

  out_path = File.expand_path(File.dirname(__FILE__) + "/_cukes/" + filename.gsub("_site/","").gsub("/","").gsub(".feature",".md"))
  file = File.open(out_path, "w")

  file.puts("---")
  file.puts("layout: cuke")
  file.puts("title: " + filename)

  featureName = doc[:feature][:name]
  file.puts("feature: " + featureName)

  scensArr = Array[]
  tagsArr = Array[]
  for child in doc[:feature][:children]
  	keyword = child[:keyword]
    if keyword == "Scenario"
      scensArr.push(child[:name])
    end

    tags = child[:tags].to_a
    for tag in tags
    	tagsArr.push(tag[:name].gsub("@",""))
    end

    # puts doc

  end
  file.puts("scenarios: " + scensArr.to_s)
  file.puts("tags: " + tagsArr.to_s)

  file.puts("---")

  file.puts("```cucumber")
  file.puts(IO.read(in_path))
  file.puts("```")

  file.close unless file.nil?


}