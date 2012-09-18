<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
  <button>Toggle</button>
<p>Hello</p>
<p style="display: none">Good Bye</p>
<script>

$("button").click(function () {
$("p").toggle();
$('#tableInfo').toggle();
});


</script>

        <button name="info">?</button>
        <div  style="display : none" id="tableInfo">
        <table border="1"><tr><td>ID Tema</td><td>'+$(this).attr('idTema')+'</td></tr>
        <tr><td>Tutor</td><td>'+$(this).attr('nick')+'</td></tr>
        </table>
        </div>
</body>
</html>