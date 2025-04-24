<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Room Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-gray: #f8f9fa;
            --dark-gray: #6c757d;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #f5f7ff;
            color: #2b2d42;
        }
        
        .booking-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
        }
        
        .booking-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        
        .booking-header h2 {
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .booking-header p {
            color: var(--dark-gray);
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #495057;
        }
        
        .form-control, .form-select {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            transition: all 0.3s;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        .btn-book {
            background-color: var(--primary-color);
            border: none;
            padding: 12px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-book:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .room-features {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .feature-card {
            flex: 1;
            padding: 20px;
            background: var(--light-gray);
            border-radius: 8px;
            text-align: center;
            transition: all 0.3s;
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        
        .feature-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .feature-desc {
            color: var(--dark-gray);
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .booking-container {
                margin: 20px;
                padding: 20px;
            }
            
            .room-features {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="booking-container">
        
        <a href="dashboard.jsp" class="logout-btn">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </a>
            <div class="booking-header">
                <h2><i class="fas fa-bed me-2"></i>Hostel Room Booking</h2>
                <p class="mb-0">Select your preferred room type and complete your booking</p>
            </div>
            
            <form action="BookingRoom" method="post">
                <div class="form-group">
                    <label for="name" class="form-label">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="roomType" class="form-label">Room Type</label>
                            <select class="form-select" id="roomType" name="roomType" required onchange="updateRoomNumbers()">
                                <option value="" selected disabled>-- Select Room Type --</option>
                                <option value="AC">AC Room</option>
                                <option value="Non-AC">Non-AC Room</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="roomCapacity" class="form-label">Room Capacity</label>
                            <select class="form-select" id="roomCapacity" name="roomCapacity" required onchange="updateRoomNumbers()">
                                <option value="" selected disabled>-- Select Capacity --</option>
                                <option value="1">Single Occupancy</option>
                                <option value="2">Double Occupancy</option>
                                <option value="4">4-Seater</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="roomNo" class="form-label">Room Number</label>
                    <select class="form-select" id="roomNo" name="roomNo" required>
                        <option value="" selected disabled>-- Select Room --</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary btn-book">
                    <i class="fas fa-check-circle me-2"></i>Confirm Booking
                </button>
            </form>
            
            <div class="room-features">
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-snowflake"></i></div>
                    <div class="feature-title">AC Rooms</div>
                    <div class="feature-desc">Temperature controlled comfort</div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-wifi"></i></div>
                    <div class="feature-title">High-Speed WiFi</div>
                    <div class="feature-desc">Uninterrupted connectivity</div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                    <div class="feature-title">24/7 Security</div>
                    <div class="feature-desc">Safe and secure environment</div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function updateRoomNumbers() {
            const roomType = document.getElementById("roomType").value;
            const roomCapacity = document.getElementById("roomCapacity").value;
            const roomNoSelect = document.getElementById("roomNo");

            // Clear current options
            roomNoSelect.innerHTML = "";
            roomNoSelect.appendChild(new Option("-- Select Room --", "", true, true));

            if (roomType && roomCapacity) {
                let start = 1;
                let end = 10;

                if (roomType === "AC" && roomCapacity === "1") {
                    start = 1; end = 10;
                } else if (roomType === "AC" && roomCapacity === "2") {
                    start = 11; end = 20;
                } else if (roomType === "AC" && roomCapacity === "4") {
                    start = 21; end = 30;
                } else if (roomType === "Non-AC" && roomCapacity === "1") {
                    start = 31; end = 40;
                } else if (roomType === "Non-AC" && roomCapacity === "2") {
                    start = 41; end = 50;
                } else if (roomType === "Non-AC" && roomCapacity === "4") {
                    start = 51; end = 60;
                }

                for (let i = start; i <= end; i++) {
                    let option = new Option("Room " + i, i);
                    roomNoSelect.appendChild(option);
                }
            }
        }
    </script>
</body>
</html>