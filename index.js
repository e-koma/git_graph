var gitgraph = new GitGraph();

// create master branch & commit
var master = gitgraph.branch('master');
gitgraph.commit();

// create develop branch & twice commits
var develop = gitgraph.branch('develop');
gitgraph.commit().commit();

// checkout master branch & commit
master.checkout();
gitgraph.commit();

// merge develop to master
develop.merge(master);
