const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

const template = document.getElementById("todoItemTemplate");
const containerToDo = document.getElementById("todosContainer");

todos.forEach((element) => {
  const clone = template.content.cloneNode(true);
  clone.querySelector(".title").innerText = element.title;
  clone.querySelector("input").checked = element.done;
  containerToDo.appendChild(clone);
});

// TODO: Use the template in the `index.html` to dynamically generate a list based on `todos` array
