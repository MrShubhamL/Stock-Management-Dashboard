var LedgerName = null;
		var isNew = true;
		function myFunction1(){
			var a = document.getElementById("ledgerName").value;
			$.ajax({
				 type: "POST",
			     url: "AjaxPages/AllLedgerNames.jsp",
			     data: { "LedgerName": a },
			     
			     success: function(data) {
			            isNew = false;
			            var obj = JSON.parse(data);
			            LedgerName = obj[0].a
			            $('#LName').val(obj[0].ledgerName)
			            $('#LContact').val(obj[0].ledgerContact)
			            $('#LEmail').val(obj[0].ledgerEmail)
			            $('#LregiId').val(obj[0].ledgerRegId)

			        }
			})
		}

		
		
		
var LedgerContact = null;
		function myFunction2(){
			var b = document.getElementById("ledgerContact").value;
			$.ajax({
				 type: "POST",
			     url: "AjaxPages/AllLedgerContacts.jsp",
			     data: { "LedgerContact": b },
			     
			     success: function(data) {
			            isNew = false;
			            var obj = JSON.parse(data);
			            LedgerName = obj[0].b
			            $('#LName').val(obj[0].ledgerName)
			            $('#LContact').val(obj[0].ledgerContact)
			            $('#LEmail').val(obj[0].ledgerEmail)
			            $('#LregiId').val(obj[0].ledgerRegId)

			        }
			})
		}
		




function LedgerFun(){
		var mm = document.getElementById("ledgerName").value;
			$.ajax({
				 type: "POST",
			     url: "AjaxPages/LedgerProducts.jsp",
			     data: { "LedgerName": mm },
			     
			     success: function(data) {
			            $('#materialName').html(data);
			        }
			})
	}