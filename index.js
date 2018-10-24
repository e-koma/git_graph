var gitgraph = new GitGraph();

// masterブランチを作成 ＆ コミット
var master = gitgraph.branch('master');
gitgraph.commit();

// developブランチを作成 ＆ 2回コミット
var develop = gitgraph.branch('develop');
gitgraph.commit().commit();

// HEADをmasterブランチに切り替えてコミット
master.checkout();
gitgraph.commit();

// developブランチをmasterブランチにマージ
develop.merge(master);
