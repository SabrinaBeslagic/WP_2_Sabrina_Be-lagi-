<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header('Content-Type: application/json');


$input = file_get_contents('php://input'); 
$data = json_decode($input, true);


$user_username = $data['username'] ?? null;
$user_password = $data['password'] ?? null;

if (!$user_username || !$user_password) {
    echo json_encode(['success' => false, 'message' => 'Invalid username or password.']);
    exit;
}


$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "league"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed.']);
    exit;
}


$stmt = $conn->prepare("SELECT id, username, password, role FROM user_table WHERE username = ?");
$stmt->bind_param("s", $user_username); // "s" means the parameter is a string
$stmt->execute();
$result = $stmt->get_result();

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();
    
    
    if (password_verify($user_password, $user['password'])) {
      
        if ($user['role'] === 'admin') {
            echo json_encode(['success' => true, 'message' => 'Login successful.', 'role' => 'admin', 'redirect' => 'admindash']);
        } elseif ($user['role'] === 'user') {
            echo json_encode(['success' => true, 'message' => 'Login successful.', 'role' => 'user', 'redirect' => 'home']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Role not recognized.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Invalid username or password.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid username or password.']);
}

$conn->close();
?>
