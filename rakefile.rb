
desc "Tâche principale"
task :default => [:docgen] do
	puts "\n--> Code OK"
end

desc "Génération de la documentation"
task :docgen do
	puts "Test de la documentation..."
	sh "rdoc --exclude=sources/tests --visibility=nodoc --root=sources -C --quiet"
	puts "Suppression de l'ancienne documentation..."
	sh "rm -Rf doc"
	puts "Génération de la nouvelle documentation..."
	sh "rdoc --exclude=sources/tests --tab-width=4 --visibility=protected --root=sources --format=darkfish --output=doc --quiet"
end
