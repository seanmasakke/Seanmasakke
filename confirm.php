<?php
include "includes/koneksi.php";

echo "<h2>✅ Tes Koneksi dan Data</h2>";

$stmt = $pdo->query("SELECT * FROM users");
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($users) {
    echo "<h3>Data User:</h3>";
    foreach ($users as $u) {
        echo $u['id'] . ". " . htmlspecialchars($u['nama']) . " - " . htmlspecialchars($u['email']) . "<br>";
    }
} else {
    echo "Tidak ada data user.";
}
?>