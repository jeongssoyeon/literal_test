<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Test Page</title>
</head>
<body>
    <h2>Reading Rooms</h2>
    <table border="1">
        <tr>
            <th>Room Code</th>
            <th>Duration</th>
            <th>Room Amount</th>
        </tr>
        <c:forEach var="room" items="${readingRooms}">
            <tr>
                <td>${room.room_code}</td>
                <td>${room.duration}</td>
                <td>${room.room_amount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
