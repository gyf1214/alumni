$(document).ready(function () {
	$("#submit").click(function () {
		if ($("#ID").val() != "") {
			$("#form").submit();
		}
	});
	$("#file_submit").click(function () {
		if ($("#ID").val() != "" && $("#file").val() != "") {
			$("#form").submit();
		}
	});
	$("#ID").addClass("long");
	$("#address").addClass("long");
	$("#hobby").addClass("long");
});