<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "league";  


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Povezivanje s bazom nije uspjelo: " . $conn->connect_error);
}


$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        if (isset($_GET['id'])) {
            $id = intval($_GET['id']);
            $sql = "SELECT * FROM user_table WHERE id=$id";
        } else {
            $sql = "SELECT * FROM user_table";
        }

        $result = $conn->query($sql);
        $users = [];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $users[] = $row;
            }
        }
        echo json_encode($users);
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        
        if (!empty($data->first_name) && !empty($data->last_name) && !empty($data->username) && !empty($data->email) && !empty($data->password) && isset($data->role)) {
            $first_name = $conn->real_escape_string($data->first_name);
            $last_name = $conn->real_escape_string($data->last_name);
            $username = $conn->real_escape_string($data->username);
            $email = $conn->real_escape_string($data->email);
            $password = $conn->real_escape_string($data->password);
            $role = $conn->real_escape_string($data->role);

         
            $sql = "INSERT INTO user_table (first_name, last_name, username, email, password, role) 
                    VALUES ('$first_name', '$last_name', '$username', '$email', '$password', '$role')";

            if ($conn->query($sql)) {
                echo json_encode(["message" => "Korisnik uspješno dodan."]);
            } else {
                echo json_encode(["error" => "Greška pri dodavanju korisnika."]);
            }
        } else {
            echo json_encode(["error" => "Svi podaci su obavezni."]);
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->first_name) && !empty($data->last_name) && !empty($data->username) && !empty($data->email) && !empty($data->password) && isset($data->role)) {
            $id = intval($data->id);  
            $first_name = $conn->real_escape_string($data->first_name);
            $last_name = $conn->real_escape_string($data->last_name);
            $username = $conn->real_escape_string($data->username);
            $email = $conn->real_escape_string($data->email);
            $password = $conn->real_escape_string($data->password);
            $role = $conn->real_escape_string($data->role);

            $sql = "UPDATE user_table 
                    SET first_name='$first_name', last_name='$last_name', username='$username', email='$email', password='$password', role='$role' 
                    WHERE id=$id";

            if ($conn->query($sql)) {
                echo json_encode(["message" => "Korisnik uspješno ažuriran."]);
            } else {
                echo json_encode(["error" => "Greška pri ažuriranju korisnika."]);
            }
        } else {
            echo json_encode(["error" => "Svi podaci su obavezni."]);
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $id = intval($data->id);  
            $sql = "DELETE FROM user_table WHERE id=$id";

            if ($conn->query($sql)) {
                echo json_encode(["message" => "Korisnik uspješno obrisan."]);
            } else {
                echo json_encode(["error" => "Greška pri brisanju korisnika."]);
            }
        } else {
            echo json_encode(["error" => "ID korisnika je obavezan."]);
        }
        break;

    default:
        echo json_encode(["error" => "Nevažeća HTTP metoda."]);
        break;
}


$conn->close();
?>
