<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="DocumentManagementSystem.UploadFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>  
    <html>  
    <head>
        <title>File Upload with Preview</title>
        <link rel="stylesheet" href="CSS/UploadFileLayout.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.11.1/viewer.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            .viewer-container {
                max-width: 600px;
                max-height: 600px;
                display: none;
                margin: 0 auto;
            }
        </style>

        <script type="text/javascript">
            function previewFile(input) {
                var imagePreview = document.getElementById('imagePreview');
                var pdfPreview = document.getElementById('pdfPreview');
                var docPreview = document.getElementById('docPreview');
                var xlsPreview = document.getElementById('xlsPreview');
                var filePreview = document.getElementById('filePreview');
                var file = input.files[0];

                if (file.type.match('image.*')) {
                    // Display image preview
                    imagePreview.src = URL.createObjectURL(file);
                    imagePreview.style.display = 'block';
                    pdfPreview.style.display = 'none';
                    docPreview.style.display = 'none';
                    xlsPreview.style.display = 'none';
                    filePreview.style.display = 'none';
                } else if (file.type === 'application/pdf') {
                    // Display PDF preview
                    pdfPreview.src = URL.createObjectURL(file);
                    pdfPreview.style.display = 'block';
                    imagePreview.style.display = 'none';
                    docPreview.style.display = 'none';
                    xlsPreview.style.display = 'none';
                    filePreview.style.display = 'none';
                } else if (file.type === 'application/msword' || file.name.endsWith('.docx')) {
                    // Display DOCX preview using GroupDocs.Viewer
                    displayGroupDocsViewer('docPreview', file);
                    imagePreview.style.display = 'none';
                    pdfPreview.style.display = 'none';
                    xlsPreview.style.display = 'none';
                    filePreview.style.display = 'none';
                } else if (file.type === 'application/vnd.ms-excel' || file.name.endsWith('.xlsx')) {
                    // Display Excel preview using GroupDocs.Viewer
                    displayGroupDocsViewer('xlsPreview', file);
                    imagePreview.style.display = 'none';
                    pdfPreview.style.display = 'none';
                    docPreview.style.display = 'none';
                    filePreview.style.display = 'none';
                } else {
                    // Display file using Viewer.js for unsupported types
                    var viewer = new Viewer(filePreview, { inline: false });
                    viewer.destroy(); // Destroy existing viewer instance
                    viewer.setOptions({ inline: true }); // Set inline option to true
                    viewer.view(file); // Display file
                    filePreview.style.display = 'block';
                    imagePreview.style.display = 'none';
                    pdfPreview.style.display = 'none';
                    docPreview.style.display = 'none';
                    xlsPreview.style.display = 'none';
                }
            }

            function displayGroupDocsViewer(containerId, file) {
                $.ajax({
                    type: "POST",
                    url: "GroupDocsViewerHandler.ashx",
                    data: { fileName: file.name },
                    success: function (response) {
                        $('#' + containerId).attr('src', response);
                        $('#' + containerId).show();
                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + xhr.responseText);
                    }
                });
            }
        </script>
    </head>
    <body>  
        <div class="drop-area" ondrop="handleDrop(event)" ondragover="event.preventDefault()">
            <p>Drag & drop files here or click to select files.</p>
            <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#FF66CC" Font-Size="Medium" Height="38px" style="max-width: 300px; max-height: 300px; display: block; margin: 0 auto;" onchange="previewFile(this);"/>
        </div>  
        <img id="imagePreview" src="#" alt="" style="max-width: 300px; max-height: 300px; display: none; margin: 0 auto;"/>
        <iframe id="pdfPreview" style="width: 600px; height: 600px; display: none; margin: 0 auto;"></iframe>
        <iframe id="docPreview" class="viewer-container"></iframe>
        <iframe id="xlsPreview" class="viewer-container"></iframe>
        <div id="filePreview" class="viewer" style="max-width: 600px; max-height: 600px; display: none; margin: 0 auto;"></div>

        <br />

        <p>  
            <asp:Button ID="btnUpload" runat="server" BackColor="Aqua" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Height="48px" Text="Upload" style="max-width: 300px; max-height: 300px; display: block; margin: 0 auto;" OnClick="btnUpload_Click" />  
            <asp:Button ID="btnDownload" runat="server" BackColor="LightBlue" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="X-Large" Height="48px" Text="Download" style="max-width: 300px; max-height: 300px; display: block; margin: 0 auto;" OnClick="btnDownload_Click" />  
            <asp:Label ID="Label1" runat="server" BackColor="LightGreen" Font-Size="Medium" Text="Label" style="max-width: 300px; max-height: 300px; display: block; margin: 0 auto;"></asp:Label>  
        </p>  
    </body>  
    </html>  
</asp:Content>
