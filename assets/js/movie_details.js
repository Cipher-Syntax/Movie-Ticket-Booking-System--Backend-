// USE FOR DATE AND TIME SELECTION

document.addEventListener("DOMContentLoaded", function () {
    let dates = document.querySelectorAll(".date");
    let timeSlots = document.querySelectorAll(".time");

    function handleSelection(elements) {
        elements.forEach(function (element) {
            element.addEventListener("click", function () {
                if (this.classList.contains("selected")) {
                    this.classList.remove("selected");

                    if (this.classList.contains("date")) {
                        document.getElementById("selected_date_input").value = "";
                    }
                    if (this.classList.contains("time")) {
                        document.getElementById("selected_time_input").value = "";
                    }
                } 
                else {
                    elements.forEach(item => item.classList.remove("selected"));

                    this.classList.add("selected");
                    
                    if (this.classList.contains("date")) {
                        document.getElementById("selected_date_input").value = this.getAttribute("data-date");
                    }
                    if (this.classList.contains("time")) {
                        document.getElementById("selected_time_input").value = this.getAttribute("data-time");
                    }
                }
            });
        });
    }

    handleSelection(dates);
    handleSelection(timeSlots);
});


// USE FOR SYNOPSIS (SEE MORE, SEE LESS)
function toggleText() {
    let dots = document.getElementById("dots");
    let moreText = document.getElementById("more");
    let btnText = document.getElementById("toggleBtn");

    if (moreText.style.display === "none" || moreText.style.display === "") {
        dots.style.display = "none";
        moreText.style.display = "inline";
        btnText.innerHTML = "See Less";
    } else {
        dots.style.display = "inline";
        moreText.style.display = "none";
        btnText.innerHTML = "See More";
    }
};


// USE FOR DATABASE
document.addEventListener("DOMContentLoaded", function () {
    let selectedDateInput = document.getElementById("selected_date_input");
    let selectedTimeInput = document.getElementById("selected_time_input");
    let selectedDate = null;
    let selectedTime = null;

    // Select and update date
    document.querySelectorAll(".date").forEach(date => {
        date.addEventListener("click", function () {
            document.querySelectorAll(".date").forEach(d => d.classList.remove("selected"));
            this.classList.add("selected");
            selectedDate = this.getAttribute("data-date");
            selectedDateInput.value = selectedDate;
        });
    });

    // Select and update time
    document.querySelectorAll(".time").forEach(time => {
        time.addEventListener("click", function () {
            document.querySelectorAll(".time").forEach(t => t.classList.remove("selected"));
            this.classList.add("selected");
            selectedTime = this.getAttribute("data-time");
            selectedTimeInput.value = selectedTime;
        });
    });

    // Validate form submission
    document.getElementById("bookTicket-btn").addEventListener("click", function (e) {
        if (!selectedDate || !selectedTime) {
            e.preventDefault();
            alert("Please select a date and time before proceeding....");
        }
    });
});
