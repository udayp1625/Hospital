<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Prescription Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 20px;
            justify-content: center;
        }
        .main {
            border: 2px solid #444;
            border-radius: 10px;
            width: 90%;
            max-width: 600px;
            background: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            padding: 30px 40px;
            box-sizing: border-box;
            position: relative;
            margin:0% auto;
        }
        h1 {
            text-align: center;
            border-bottom: 2px solid #007acc;
            padding-bottom: 10px;
            color: #007acc;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 2px;
        }
        .inner h2 {
            font-weight: 600;
            margin-bottom: 18px;
            font-size: 1.1rem;
            color: #333;
            
        }
        .inner h2 span {
            font-weight: 400;
            color: #555;
        }
        #downloadBtn {
            background-color: #007acc;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right:1%;
 
        }
        #downloadBtn:hover {
            background-color: #005f99;
        }
        .button
        {
        	background-color: #007acc;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-left:1%;	
        }
        .buttondiv
        {
        display:block;
        text-align:center;
        }

        /* Responsive */
        @media (max-width: 700px) {
            .main {
                padding: 20px 25px;
                width: 95%;
            }
            .inner h2 {
                font-size: 1rem;
                margin-bottom: 14px;
            }
        }
    </style>
</head>
<body>
 <div class="main" id="prescription">
    <h1>Prescription</h1>
    <div class="inner">
        <h2>Patient Name: <span><%= request.getAttribute("pname") != null ? request.getAttribute("pname") : "N/A" %></span></h2>
        <h2>Patient Email: <span><%= request.getAttribute("patientEmail") != null ? request.getAttribute("patientEmail") : "N/A" %></span></h2>   
        <h2>Doctor Name: <span><%= request.getAttribute("dname") != null ? request.getAttribute("dname") : "N/A" %></span></h2>
        <h2>Medicine: <span><%= request.getAttribute("medicine") != null ? request.getAttribute("medicine") : "N/A" %></span></h2>
        <h2>Dosage: <span><%= request.getAttribute("dosage") != null ? request.getAttribute("dosage") : "N/A" %></span></h2>
        <h2>Instructions: <span><%= request.getAttribute("instruction") != null ? request.getAttribute("instruction") : "N/A" %></span></h2>
    </div>
 </div>
<br>
<div class="buttondiv">
<button class="button" id="downloadBtn">Download as Image</button>
<button class="button" type="button" id="emailBtn">Send on Email</button>
</div>
 <!-- Include html2canvas from CDN -->
 <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

 <script>
    document.getElementById('downloadBtn').addEventListener('click', () => {
        const prescriptionDiv = document.getElementById('prescription');

        html2canvas(prescriptionDiv, {scale: 2}).then(canvas => {
            // Create image from canvas
            const image = canvas.toDataURL("image/png", 1.0);

            // Create a temporary link to download the image
            const link = document.createElement('a');
            link.href = image;
            link.download = 'prescription.png';

            // Trigger the download
            link.click();
        });
    });
    document.getElementById('emailBtn').addEventListener('click', () => {
        const prescriptionDiv = document.getElementById('prescription');

        html2canvas(prescriptionDiv, {scale: 2}).then(canvas => {
            const imageBase64 = canvas.toDataURL("image/png");

            // Send image to backend for emailing
            fetch('SendPrescriptionEmail', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({
                    email: '<%= request.getAttribute("patientEmail") %>', // patient email from server
                    image: imageBase64
                })
            })
            .then(res => res.text())
            .then(msg => alert(msg))
            .catch(err => console.error(err));
        });
    });

 </script>
</body>
</html>
