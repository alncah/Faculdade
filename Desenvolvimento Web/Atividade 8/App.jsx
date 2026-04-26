import { useState } from "react";
import "./App.css";

function App() {
  
  const [tasks, setTasks] = useState([]);


  const [input, setInput] = useState("");

  
  const addTask = (e) => {
    e.preventDefault();

    if (input.trim() === "") return;

    const newTask = {
      id: Date.now(),
      text: input
    };

  
    setTasks([...tasks, newTask]);

    setInput("");
  };


  const removeTask = (id) => {
    const newTasks = tasks.filter(task => task.id !== id);
    setTasks(newTasks);
  };

  return (
    <div className="container">
      <h1>Lista de Tarefas</h1>

      <form className="input-area" onSubmit={addTask}>
        <input
          type="text"
          placeholder="Digite uma tarefa..."
          value={input}
          onChange={(e) => setInput(e.target.value)}
        />
        <button type="submit">Adicionar</button>
      </form>

      <ul>
        {tasks.map((task) => (
          <li key={task.id}>
            {task.text}
            <button onClick={() => removeTask(task.id)}>
              Remover
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;