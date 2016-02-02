
desc "Tâche principale"
task :default => [:docgen] do
end

desc "Génération de la documentation"
task :docgen do
	sh "rdoc --exclude=sources/tests --visibility=nodoc --root=sources -C"
	sh "rm -Rf doc"
	sh "rdoc --exclude=sources/tests --tab-width=4 --visibility=protected --root=sources --format=darkfish --output=doc"
end
