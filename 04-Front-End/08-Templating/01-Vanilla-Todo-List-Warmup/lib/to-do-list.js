const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true },
  { title: "Groceries", done: false }
];

const containerToDos = document.getElementById("todosContainer");

todos.forEach((element) => {
  const toDo = `
  <div class="shadow-sm rounded px-4 py-3 mb-2 border d-flex">
    <input class="d-flex form-check-input me-1" type="checkbox" ${element.done ? "checked" : ""}>
    <div>${element.title}</div>
  </div>`;
  containerToDos.insertAdjacentHTML("beforeend", toDo);
});
