desc "Update gb-pages branch and push to origin"
task :deploy do
  `git branch -D gh-pages`
  `git checkout -b gh-pages`
  `git filter-branch --subdirectory-filter _site/ -f`
  `git checkout source`
  `git push --all origin`
end
