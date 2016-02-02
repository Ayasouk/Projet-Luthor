
desc "Tâche principale"
task :default => [:docgen] do
end

desc "Génération de la documentation"
task :docgen do
	sh "rdoc --exclude=tests --visibility=nodoc -C"
	sh "rm -Rf doc"
	sh "rdoc --exclude=tests --tab-width=4 --visibility=protected --format=darkfish --output=doc"
end
