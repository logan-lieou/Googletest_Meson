sources = [ 'main.cc' ]
gtest = subproject('gtest')
gtest_dep = gtest.get_variable('gtest_dep')

executable('googletest_example', sources,
	dependencies: [gtest_dep],
	install: true)
