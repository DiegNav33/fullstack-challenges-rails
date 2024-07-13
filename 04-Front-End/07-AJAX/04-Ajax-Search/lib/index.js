const omdbapiUrl = "http://www.omdbapi.com/";
const apiKey = "adf1f2d7";
const apiKeyDiego = "6c87b107";
const form = document.getElementById("search-movies");
const movieCards = document.getElementById("movie-cards");
const input = document.getElementById("movie-name");
const spinner = document.getElementById("spinner");

const fetchMovies = (event) => {
  event.preventDefault();
  const inputValue = input.value.trim();
  if (inputValue === "") {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "Please enter a movie name"
    });
    return;
  }
  const urlBuilt = `${omdbapiUrl}?s=${inputValue}&apikey=${apiKeyDiego}`;
  movieCards.innerHTML = "";
  spinner.style.display = "block"; // Show spinner
  fetch(urlBuilt)
  .then(response => response.json())
  .then(data => {
    spinner.style.display = "none"; // Hide spinner
    if (data.Response === "False") {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "No movies found..."
      });
      return;
    } else {
      console.log(data);
      const movies = data.Search;
      movies.forEach((movie) => {
        movieCards.innerHTML += `
        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
          <div class="card mb-2">
            <img src="${movie.Poster}" class="card-img-top" alt="${movie.Title} poster">
            <div class="card-body">
              <span class="badge bg-primary mb-2">${movie.Year}</span>
              <h5 class="card-title">${movie.Title}</h5>
            </div>
          </div>
        </div>`;
      });
    }
  })
  .catch(error => {
    spinner.style.display = "none"; // Hide spinner in case of error
    console.error("Error fetching movies:", error);
    movieCards.innerHTML = "<h2>Error fetching movies...</h2>";
  });
};
form.addEventListener("submit", fetchMovies);
input.addEventListener("keydown", (event) => {
  if (event.key === "Enter") {
    event.preventDefault();
    fetchMovies(event);
  }
});
