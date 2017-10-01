MAIN = 'ml_hw1' # name of the pdf

OUT_PDF = "#{MAIN}.pdf"
OUT_TEX = "#{MAIN}.tex"
MD_FILES = FileList.new('00-metadata.yaml', '??-*.md')

#PANDOC_HEADER = 'pandoc_templates/ieee-pandoc-template/custom.latex'
BIB_LIB = 'bib.bib'
#CSL = 'CSL/chicago-author-date.csl'
TEX_HEADER='00-header.tex'
#CITEPROC_PREAMBLE='99-references-preamble.tex'
#PANDOC_TEMPLATE = 'pandoc_templates/ieee-pandoc-template/template.latex'
CONFIG_FILES = FileList[TEX_HEADER, BIB_LIB] #, CSL, PANDOC_HEADER, PANDOC_TEMPLATE]

#"rules to generate the pdf"
file OUT_PDF => (MD_FILES+CONFIG_FILES) do
  puts 'running pandoc...'
  %x{ pandoc \
        --standalone \
        --latex-engine lualatex \
        -H #{TEX_HEADER} \
        --biblatex \
        --bibliography "#{BIB_LIB}" \
        -f markdown \
        #{MD_FILES.map {|f| "\"#{f}\""} .join(" ")} \
        -o "#{OUT_PDF}"
  }
        #-M citeproc-preamble=#{CITEPROC_PREAMBLE} \
        #--filter pandoc-citeproc \
        #--filter pandoc-citeproc-preamble \
        #--csl "#{CSL}" \
        #--template "#{PANDOC_TEMPLATE}" \
  puts "DONE"
end

#"rules to generate the LaTeX file"
file OUT_TEX => (MD_FILES+CONFIG_FILES) do
  puts 'running pandoc...'
  %x{ pandoc \
        --standalone \
        --latex-engine lualatex \
        -H #{TEX_HEADER} \
        --biblatex \
        --bibliography "#{BIB_LIB}" \
        -f markdown \
        #{MD_FILES.map {|f| "\"#{f}\""} .join(" ")} \
        -o "#{OUT_TEX}"
  }
        #-M citeproc-preamble=#{CITEPROC_PREAMBLE} \
        #--filter pandoc-citeproc \
        #--filter pandoc-citeproc-preamble \
        #--csl "#{CSL}" \
        #--template "#{PANDOC_TEMPLATE}" \
  puts "DONE"
end

task :default => [:compile]

desc "Creates pdf file"
task :compile => [OUT_PDF]

desc "Saves underlying LaTeX file"
task :tex => [OUT_TEX]

desc "Runs 'compile' every second, if no change have been made nothing is done"
task :run do
  all_tasks = [OUT_PDF].map {|t| Rake::Task[t]}
  loop do
    begin
      all_tasks.each {|t| t.reenable}
      all_tasks.each {|t| t.invoke}
    rescue => e
      puts "Error: #{e}, sleeping for 15 seconds."
      Kernel.sleep 15
    end
    Kernel.sleep 1
  end
end
