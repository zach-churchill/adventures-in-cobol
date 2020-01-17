fizzbuzz: fun/fizzbuzz.cbl
	cobc -x -std=cobol85 -o a.out fun/fizzbuzz.cbl
pe:
	cobc -x -std=cobol85 -o a.out project-euler/problem${num}.cbl
