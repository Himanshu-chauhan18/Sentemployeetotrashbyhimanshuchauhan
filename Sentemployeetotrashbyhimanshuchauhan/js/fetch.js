function loadTable() {
    fetch('php/load-table.php')
        .then((response) => response.json())
        .then((data) => {
            var tbody = document.getElementById('tbody');
            if (data['empty']) {
                tbody.innerHTML = '<tr><td colspan="6" align="center"><h3>No Record Found.</h3></td></tr>'
            } else {
                var tr = '';
                for (var i in data) {

                    tr += `<tr>
		            <td>${data[i].FirstName} ${data[i].LastName}</td>
                    
		            <td align="center"><button class="delete-btn" onclick="editRecord(${data[i].Id})">Delete</button></td>
		          </tr>`;
                }

            }
        })
        .catch((error) => {
            show_message('error', "Can't Fetch Data");
        });
}

loadTable();




function load_search() {
    var search = document.getElementById('search').value;
    if (search === '') {
        loadTable();
        return false;
    } else {
        fetch('php/fetch-search.php?search=' + search)
            .then((response) => response.json())
            .then((data) => {
                var tbody = document.getElementById('tbody');
                if (data['empty']) {
                    tbody.innerHTML = '<tr><td colspan="6" align="center"><h3>No Record Found.</h3></td></tr>'
                } else {
                    var tr = '';
                    for (var i in data) {

                        tr += `<tr>
                        <td>${data[i].Id}</td>
                        <td>${data[i].FirstName} ${data[i].LastName}</td>
		           
                        <td align="center"><button class="delete-btn" onclick="editRecord(${data[i].Id})">Delete</button></td>
		          </tr>`;
                    }
                    tbody.innerHTML = tr;
                }
            })
            .catch((error) => {
                show_message('error', "Can't Fetch Data");
            });
    }
}



function show_message(type, text) {
    if (type == 'error') {
        var message_box = document.getElementById('error-message');
    } else {
        var message_box = document.getElementById('success-message');
    }
    message_box.innerHTML = text;
    message_box.style.display = "block";
    setTimeout(function() {
        message_box.style.display = "none";
    }, 3000);
}



// Open Add new student Modal Box 
function addNewModal() {
    var addModal = document.getElementById("addModal");
    addModal.style.display = 'block';

}

// Hide Modal Box / Popup Box
function hide_modal() {
    var addModal = document.getElementById("addModal");
    addModal.style.display = 'none';

    var editModal = document.getElementById("modal");
    editModal.style.display = 'none';
}



function editRecord(id) {
    var editModal = document.getElementById("modal");
    editModal.style.display = 'block';

    document.getElementById('edit-id').value = id;




}

function modify_data() {
    var id = document.getElementById('edit-id').value;



    var formdata = {
        'Id': id,

    }



    jsondata = JSON.stringify(formdata);

    fetch('php/fetch-update.php', {
            method: 'PUT',
            body: jsondata,
            headers: {
                'Content-type': 'application/json',
            }
        })
        .then((response) => response.json())
        .then((result) => {
            console.log(result.id)
            console.log(result.fname)
            if (result.update == 'success') {
                show_message('success', 'Employee cloned successfully');
                loadTable();
                hide_modal();
                window.location = "http://localhost/Sentemployeetotrashbyhimanshuchauhan/";

            } else {
                show_message('error', 'There is someproblem while cloning the record');
                hide_modal();
            }

        })
        .catch((error) => {
            show_message('error', "There is someproblem while cloning the record : Server Problem.");
        });
    // document.getElementById('tbody').reset();

}