const input = document.getElementById("taskInput");
const button = document.getElementById("addTaskBtn");
const list = document.getElementById("taskList");

// Carregar tarefas salvas
window.addEventListener("load", () => {
    const tasks = JSON.parse(localStorage.getItem("tasks")) || [];
    tasks.forEach(task => createTask(task.text, task.completed));
});

// Salvar no localStorage
function saveTasks() {
    const tasks = [];
    document.querySelectorAll("li").forEach(li => {
        tasks.push({
            text: li.firstChild.textContent,
            completed: li.classList.contains("completed")
        });
    });
    localStorage.setItem("tasks", JSON.stringify(tasks));
}

// Criar tarefa
function createTask(text, completed = false) {
    const li = document.createElement("li");

    const span = document.createElement("span");
    span.textContent = text;

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "X";
    deleteBtn.classList.add("delete-btn");

    li.appendChild(span);
    li.appendChild(deleteBtn);

    if (completed) {
        li.classList.add("completed");
    }

    list.appendChild(li);
}

// Adicionar tarefa
function addTask() {
    const taskText = input.value.trim();
    if (taskText === "") return;

    createTask(taskText);
    saveTasks();

    input.value = "";
    input.focus();
}

button.addEventListener("click", addTask);

// Enter adiciona também
input.addEventListener("keypress", (e) => {
    if (e.key === "Enter") addTask();
});

// Delegação de eventos
list.addEventListener("click", (event) => {
    const li = event.target.closest("li");

    if (!li) return;

    // Botão deletar
    if (event.target.classList.contains("delete-btn")) {
        li.remove();
    } 
    // Marcar como concluído
    else {
        li.classList.toggle("completed");
    }

    saveTasks();
});