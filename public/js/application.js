$(document).ready(function () {
	$("#submit").click(function () {
		if ($("#ID").val() != "") {
			$("#form").submit();
		}
	});
});