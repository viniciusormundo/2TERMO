const Alunos = ["adriana", "alberto", "alex", "alexandre", "alice", "aline", "amanda", "ana", "andre", "antonio", "arthur", "barbara", "beatriz", "benicio", "bernardo", "bianca", "brenda", "bruna", "bruno", "caio", "camila", "carolina", "carlos", "cecilia", "celso", "clara", "daniel", "daniela", "davi", "debora", "diego", "diogo", "eduarda", "eduardo", "elisa", "emanuel", "emily", "enzo", "erick", "ester", "fabiana", "fabio", "felipe", "fernanda", "flavia", "francisco", "gabriel", "gabriela", "geovana", "giovana", "gustavo", "heitor", "heloisa", "henrique", "igor", "isabela", "isadora", "isaac", "joana", "joao", "joaquim", "jose", "julia", "juliana", "karen", "karina", "lara", "larissa", "laura", "lavinia", "leandro", "leticia", "lorenzo", "luana", "lucas", "luiz", "luiza", "manuel", "manuela", "marcelo", "marcos", "maria", "mariana", "marina", "matheus", "miguel", "murilo", "natalia", "nicolas", "otavio", "paola", "paulo", "pedro", "priscila", "rafael", "rafaela", "renata", "ricardo", "roberto", "rodrigo"];

console.log(`O primeiro aluno da lista é: ${Alunos[0]}`);
console.log(`Quantidade de alunos: ${Alunos.length}`);

for (let i = 0; i < Alunos.length; i++) {
    console.log(`${i + 1} - ${Alunos[i]}`);
}