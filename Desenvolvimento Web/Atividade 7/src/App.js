import Header from "./components/Header";
import Navigation from "./components/Navigation";
import Article from "./components/Article";
import Sidebar from "./components/Sidebar";
import Footer from "./components/Footer";
import "./estilo.css";

function App() {
  const post = {
    titulo: "Guia de Conquistas",
    autor: "Leon Kennedy",
    data: "22 de março de 2026",
    conteudo:
      "Um guia mostrando como conseguir as conquistas do jogo Resident Evil 2 (2019)!"
  };

  return (
    <div className="container">
      <Header />
      <Navigation />

      <main>
        <Article
          titulo={post.titulo}
          autor={post.autor}
          data={post.data}
          conteudo={post.conteudo}
        />
      </main>

      <Sidebar />
      <Footer />
    </div>
  );
}

export default App;