
desc "T\u{E2}che principale"
task :default => [:docgen] do
end

desc "G\u{E9}n\u{E9}ration de la documentation"
task :docgen do
	sh "rdoc -x tests -U -w 4 --visibility=protected -C -o doc -c utf-16"
end
