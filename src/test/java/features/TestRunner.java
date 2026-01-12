package features;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testeCriarUsuario() {
        return Karate.run(//"classpath:features/users/criarUsuario/criar-usuario-sucesso.feature",
                //"classpath:features/gerarToken/auth.feature",
                //"classpath:features/users/deletarUsuario/deletar-usuario.feature"
                //"classpath:features/books/buscarLivros/buscar-livros.feature",
                //"classpath:features/books/adicionarLivro/adicionar-livro.feature"
                //"classpath:features/books/buscarLivros/buscar-isbn.feature"
                "classpath:features/books/alterarLivro/alterar-livro.feature"

        ).relativeTo(TestRunner.class);
    }
    @Karate.Test
    Karate gerarToken() {
        return Karate.run("classpath:features/gerarToken/auth.feature"
        ).relativeTo(TestRunner.class);
    }

}
