class GfBeauty
  def self.process
    current_project = `pwd`
    current_project = current_project.gsub(/\n/,"")
    content = File.read(current_project + "/Gemfile")
    content = content.gsub(/\#\s.*\s*/,"")
    content = content.gsub(/'/, '"')
    content = content.gsub(/\s*^group/, "\n\ngroup")
    content = content.gsub(/\s*^\s+^gem/, "\n\ngem")
    File.open(current_project + "/Gemfile", "w") do |file|
      file.puts content
    end
    system "echo", "-e", "\e[92mYour Gemfile was successfully beautified!"
  rescue Exception => e
    system "echo", "-e", "\e[91m#{e.message}"
    system "echo", "-e", "\e[91mMake sure you're in the right place!"
  end
end
