function Article(props) {
  return (
    <article>
      <h2>{props.titulo}</h2>

      <p><strong>Autor:</strong> {props.autor}</p>

      <time>{props.data}</time>

      <p>{props.conteudo}</p>

      <figure className="capa-jogo">
        <img src="/CapaDoJogo.jpg" alt="Capa" />
      </figure>

      <figure className="conquista">
        <img src="/Um.jpg" alt="1" />
        <figcaption>
          <div className="titulo-legenda">
            Bem-vindo à Cidade dos Mortos
          </div>
          Desbloqueia ao chegar na delegacia.
        </figcaption>
      </figure>

      <figure className="conquista">
        <img src="/Dois.jpg" alt="2" />
        <figcaption>
          <div className="titulo-legenda">
            O Caminho da Deusa
          </div>
          Resolva o puzzle da estátua.
        </figcaption>
      </figure>
    </article>
  );
}

export default Article;