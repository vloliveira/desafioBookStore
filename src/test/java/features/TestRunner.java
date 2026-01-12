package features;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testeCriarUsuario() {
        return Karate.run("classpath:features/users/criarUsuario/criar-usuario-sucesso.feature"
        ).relativeTo(TestRunner.class);
    }

    @Karate.Test
    Karate buscarLivroIsbn() {
        return Karate.run(
                "classpath:features/books/buscarLivros/buscar-isbn.feature"

        ).relativeTo(TestRunner.class);
    }


    @Karate.Test
    Karate adicionarLivro() {
        return Karate.run(
                "classpath:features/books/adicionarLivro/adicionar-livro.feature"

        ).relativeTo(TestRunner.class);
    }

    @Karate.Test
    Karate alterarLivro() {
        return Karate.run(
                "classpath:features/books/alterarLivro/alterar-livro.feature"

        ).relativeTo(TestRunner.class);
    }

    @Karate.Test
    Karate buscarTodosLivros() {
        return Karate.run(
                "classpath:features/books/buscarLivros/buscar-livros.feature"
        ).relativeTo(TestRunner.class);
    }

    @Karate.Test
    Karate gerarToken() {
        return Karate.run("classpath:features/gerarToken/auth.feature"
        ).relativeTo(TestRunner.class);
    }
    @Karate.Test
    Karate deletarUsuario() {
        return Karate.run("classpath:features/users/deletarUsuario/deletar-usuario.feature"
        ).relativeTo(TestRunner.class);
    }

}
