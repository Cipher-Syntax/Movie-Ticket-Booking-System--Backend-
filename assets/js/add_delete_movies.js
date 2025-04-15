document.addEventListener("DOMContentLoaded", function () {
    const addButton = document.getElementById("add-movie");
    const deleteButton = document.getElementById("delete-movie");
    const addMovieGrid = document.querySelector(".add-movie-grid");
    const deleteMovieGrid = document.querySelector(".delete-movie-grid");
    
    // Add Movie Modal Elements
    const addMovieModal = document.getElementById("addMovieModal");
    const addMovieForm = document.getElementById("addMovieForm");
    const movieIdInput = document.getElementById("movie_id");
    const sourceMovieInput = document.getElementById("source_cinema");
    const movieTitleInput = document.getElementById("movie_title");
    
    // Delete Movie Modal Elements
    const deleteMovieModal = document.getElementById("deleteMovieModal");
    const deleteMovieForm = document.getElementById("deleteMovieForm");
    const deleteMovieIdInput = document.getElementById("delete_movie_id");
    const deleteCinemaTableInput = document.getElementById("delete_cinema_table");
    const deleteMovieTitleSpan = document.getElementById("delete_movie_title");

    // Modal close buttons
    const closeButtons = document.querySelectorAll(".close, .modal-cancel-btn");

    // Set initial styles for the selected button
    addButton.style.backgroundColor = "#B6116B";
    addButton.style.color = "white";
    deleteButton.style.backgroundColor = "white";
    deleteButton.style.color = "black";

    // Toggle between add and delete views
    function toggleButton(activeButton, inactiveButton, showGrid, hideGrid) {
        activeButton.style.backgroundColor = "#B6116B";
        activeButton.style.color = "white";
        inactiveButton.style.backgroundColor = "white";
        inactiveButton.style.color = "black";
        
        showGrid.style.display = "grid";
        hideGrid.style.display = "none";
    }

    addButton.addEventListener("click", function () {
        toggleButton(addButton, deleteButton, addMovieGrid, deleteMovieGrid);
    });

    deleteButton.addEventListener("click", function () {
        toggleButton(deleteButton, addButton, deleteMovieGrid, addMovieGrid);
    });

    // Handle Add Movie button clicks
    const addNowButtons = document.querySelectorAll(".add-now-btn");
    addNowButtons.forEach(button => {
        button.addEventListener("click", function() {
            const movieId = this.getAttribute("data-id");
            const movieTitle = this.getAttribute("data-title");
            const sourceCinema = this.getAttribute("data-cinema");
            
            // Populate modal form
            movieIdInput.value = movieId;
            sourceMovieInput.value = sourceCinema;
            movieTitleInput.value = movieTitle;
            
            // Show modal
            addMovieModal.style.display = "block";
        });
    });

    // Handle Delete Movie button clicks
    const deleteButtons = document.querySelectorAll(".delete-btn");
    deleteButtons.forEach(button => {
        button.addEventListener("click", function() {
            const movieId = this.getAttribute("data-id");
            const movieTitle = this.getAttribute("data-title");
            const cinemaTable = this.getAttribute("data-cinema");
            
            // Populate delete modal form
            deleteMovieIdInput.value = movieId;
            deleteCinemaTableInput.value = cinemaTable;
            deleteMovieTitleSpan.textContent = movieTitle;
            
            // Show delete modal
            deleteMovieModal.style.display = "block";
        });
    });

    // Close modals when clicking on close button or outside
    closeButtons.forEach(button => {
        button.addEventListener("click", function() {
            addMovieModal.style.display = "none";
            deleteMovieModal.style.display = "none";
        });
    });

    window.addEventListener("click", function(event) {
        if (event.target == addMovieModal) {
            addMovieModal.style.display = "none";
        }
        if (event.target == deleteMovieModal) {
            deleteMovieModal.style.display = "none";
        }
    });

    // Hide success alerts after 3 seconds
    const alerts = document.querySelectorAll('.alert');
    if (alerts.length > 0) {
        setTimeout(function() {
            alerts.forEach(alert => {
                alert.style.display = 'none';
            });
        }, 3000);
    }
});
