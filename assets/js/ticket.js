let subMenu = document.getElementById("js-sub-menu");

function toggleMenu(){
    subMenu.classList.toggle("js-open-menu");
}



// GPT GENERATED (STUPID ME)
function formatSeats(selectedSeats) {
    if (!selectedSeats) return '';
    
    // Split the seats string into an array
    const seatArray = selectedSeats.split(',').map(seat => seat.trim()).filter(seat => seat);
    
    // Group seats by row
    const seatsByRow = {};
    seatArray.forEach(seat => {
        // Extract the row letter and seat number
        const match = seat.match(/([A-K])(\d+)/i);
        if (match) {
            const row = match[1].toUpperCase();
            const number = parseInt(match[2]);
            
            if (!seatsByRow[row]) {
                seatsByRow[row] = [];
            }
            seatsByRow[row].push(number);
        }
    });
    
    // Format each row's seats
    let formattedSeats = [];
    Object.keys(seatsByRow).sort().forEach(row => {
        // Sort the seat numbers
        const numbers = seatsByRow[row].sort((a, b) => a - b);
        
        // Group consecutive numbers
        let currentStart = numbers[0];
        let currentEnd = numbers[0];
        const ranges = [];
        
        for (let i = 1; i < numbers.length; i++) {
            if (numbers[i] === currentEnd + 1) {
                currentEnd = numbers[i];
            } else {
                ranges.push(currentStart === currentEnd ? 
                    `${row}${currentStart}` : 
                    `${row}${currentStart}-${currentEnd}`);
                currentStart = currentEnd = numbers[i];
            }
        }
        
        // Add the last range
        ranges.push(currentStart === currentEnd ? 
            `${row}${currentStart}` : 
            `${row}${currentStart}-${currentEnd}`);
        
        formattedSeats.push(ranges.join(', '));
    });
    
    return formattedSeats.join(', ');
}

function adjustSeatAndGroupSeats(element, seatCount) {
    if (!element) return;
    
    if (seatCount >= 10) {
        element.style.fontSize = '10px';
    } else if (seatCount >= 5) {
        element.style.fontSize = '12px';
    } else {
        element.style.fontSize = '14px'; // Default size
    }
}

// Initialize when the page loads
document.addEventListener('DOMContentLoaded', function() {
    const seatDisplay = document.querySelector('.info-value[data-seat-display="true"]');
    if (seatDisplay) {
        const originalSeats = seatDisplay.textContent.trim();
        const seatCount = originalSeats.split(',').filter(seat => seat.trim()).length;
        
        // Format the seat display
        const formattedSeats = formatSeats(originalSeats);
        seatDisplay.textContent = formattedSeats;
        
        // Adjust font size
        adjustSeatAndGroupSeats(seatDisplay, seatCount);
    }
});



let title = document.getElementById('ticket-title');

if (title.textContent.length > 15) {
    title.style.fontSize = '12px';
}


