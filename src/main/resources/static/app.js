// --- KHỞI TẠO BẢN ĐỒ HÀ NỘI ---
// Tọa độ trung tâm là Hà Nội
const map = L.map('map').setView([21.0285, 105.8542], 12); 
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap'
}).addTo(map);

// Hàm tải dữ liệu cửa hàng từ Database và vẽ lên bản đồ
function fetchStoresAndDrawMap() {
    fetch('http://localhost:8080/api/stores')
        .then(response => response.json())
        .then(stores => {
            stores.forEach(store => {
                // Vẽ marker (điểm đánh dấu) cho từng tọa độ
                L.marker([store.latitude, store.longitude])
                 .addTo(map)
                 .bindPopup(`<b class="text-danger">${store.name}</b><br>${store.address}`);
            });
        })
        .catch(error => console.error('Lỗi khi tải dữ liệu cửa hàng:', error));
}

// Gọi hàm vẽ bản đồ
fetchStoresAndDrawMap();
// --- 2. LÀM VIỆC VỚI DỮ LIỆU SẢN PHẨM ---
const apiUrl = 'http://localhost:8080/api/products';

// Hàm lấy danh sách sản phẩm từ Java Backend và hiển thị
function fetchProducts() {
    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            const tbody = document.getElementById('productTableBody');
            tbody.innerHTML = ''; // Xóa dữ liệu cũ
            
            data.forEach(product => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><b>${product.productCode || 'N/A'}</b></td>
                    <td>${product.name}</td>
                    <td><span class="badge bg-secondary">${product.category || ''}</span></td>
                    <td style="max-width: 250px; font-size: 13px;">${product.description || ''}</td>
                    <td class="text-danger fw-bold">${product.price.toLocaleString('vi-VN')} đ</td>
                    <td>${product.stockQuantity || 0}</td>
                    <td>
                        <button class="btn btn-sm btn-warning mb-1" onclick="editProduct(${product.id})">Sửa</button>
                        <button class="btn btn-sm btn-danger mb-1" onclick="deleteProduct('${product.productCode}')">Xóa</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        })
        .catch(error => console.error('Lỗi khi tải dữ liệu:', error));
}
// Gọi hàm tải dữ liệu khi trang web vừa mở lên
fetchProducts();

// Lưu trong Form
document.getElementById('productForm').addEventListener('submit', function(event) {
    event.preventDefault(); 

    // Gom dữ liệu từ các ô nhập liệu
    const productData = {
        id: document.getElementById('productId').value || null, // Nếu có ID thì là Sửa, không có là Thêm mới
        productCode: document.getElementById('productCode').value,
        name: document.getElementById('name').value,
        category: document.getElementById('category').value,
        stockQuantity: document.getElementById('stockQuantity').value,
        price: document.getElementById('price').value,
        description: document.getElementById('description').value
    };

    // Gửi dữ liệu xuống API của Java (POST method)
    fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(productData)
    })
    .then(response => response.json())
    .then(data => {
        alert('Đã lưu sản phẩm thành công!');
        resetForm();     // Xóa trắng form
        fetchProducts(); // Tải lại bảng danh sách 
    })
    .catch(error => console.error('Lỗi khi lưu:', error));
});

// Hàm xóa trắng form
function resetForm() {
    document.getElementById('productForm').reset();
    document.getElementById('productId').value = '';
}

// Sửa trên bảng
function editProduct(id) {
    // Gọi API lấy thông tin chi tiết của 1 sản phẩm theo ID
    fetch(apiUrl + '/' + id)
        .then(response => response.json())
        .then(product => {
            document.getElementById('productId').value = product.id;
            document.getElementById('productCode').value = product.productCode;
            document.getElementById('name').value = product.name;
            document.getElementById('category').value = product.category;
            document.getElementById('stockQuantity').value = product.stockQuantity;
            document.getElementById('price').value = product.price;
            document.getElementById('description').value = product.description;
        })
        .catch(error => console.error('Lỗi khi tải chi tiết:', error));
}

//Xóa sản phẩm theo Mã SP
function deleteProduct(productCode) {
    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm mã ' + productCode + ' không?')) {
        
        // Gọi API đúng đường dẫn /code/ + mã sản phẩm
        fetch(apiUrl + '/code/' + productCode, {
            method: 'DELETE'
        })
        .then(response => {
            if (response.ok) {
                alert('Đã xóa thành công mã ' + productCode + '!');
                fetchProducts(); // Tải lại bảng
            } else {
                alert('Có lỗi xảy ra từ máy chủ!');
            }
        })
        .catch(error => console.error('Lỗi khi gọi API xóa:', error));
    }
}
// tìm kiếm
document.getElementById('searchInput').addEventListener('input', function() {
    const keyword = this.value.trim(); 

    // Nếu người dùng xóa hết chữ trong ô tìm kiếm, gọi lại toàn bộ sản phẩm
    if (keyword === '') {
        fetchProducts();
        return;
    }

    // Nếu có chữ, gọi API tìm kiếm của Java
    fetch(apiUrl + '/search?keyword=' + keyword)
        .then(response => response.json())
        .then(data => {
            const tbody = document.getElementById('productTableBody');
            tbody.innerHTML = ''; // Xóa trắng bảng hiện tại
            
            // Nếu không tìm thấy sản phẩm nào
            if(data.length === 0) {
                tbody.innerHTML = '<tr><td colspan="7" class="text-center text-muted">Không tìm thấy sản phẩm nào phù hợp!</td></tr>';
                return;
            }

            // Vẽ lại bảng với danh sách sản phẩm tìm được
            data.forEach(product => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><b>${product.productCode || 'N/A'}</b></td>
                    <td>${product.name}</td>
                    <td><span class="badge bg-secondary">${product.category || ''}</span></td>
                    <td style="max-width: 250px; font-size: 13px;">${product.description || ''}</td>
                    <td class="text-danger fw-bold">${product.price.toLocaleString('vi-VN')} đ</td>
                    <td>${product.stockQuantity || 0}</td>
                    <td>
                        <button class="btn btn-sm btn-warning mb-1" onclick="editProduct(${product.id})">Sửa</button>
                        <button class="btn btn-sm btn-danger mb-1" onclick="deleteProduct('${product.productCode}')">Xóa</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        })
        .catch(error => console.error('Lỗi khi tìm kiếm:', error));
});
//Sắp xếp
document.getElementById('sortSelect').addEventListener('change', function() {
    const sortType = this.value; // Lấy giá trị asc (tăng) hoặc desc (giảm)
    const tbody = document.getElementById('productTableBody');
    const rows = Array.from(tbody.querySelectorAll('tr')); // Lấy tất cả các dòng hiện có trên bảng

    // Nếu bảng trống hoặc đang báo "Không tìm thấy", thì không làm gì cả
    if (rows.length === 0 || rows[0].cells.length < 5) return;

    // Nếu chọn lại mặc định thì tải lại bảng gốc
    if (sortType === 'default') {
        fetchProducts(); 
        document.getElementById('searchInput').value = ''; // Xóa chữ ở ô tìm kiếm
        return;
    }

    // Tiến hành sắp xếp các dòng
    rows.sort((a, b) => {
        // Cột Giá nằm ở vị trí số 5 (index là 4). replace(/\D/g, '') dùng để xóa các ký tự không phải là số.
        const priceA = parseInt(a.cells[4].innerText.replace(/\D/g, ''));
        const priceB = parseInt(b.cells[4].innerText.replace(/\D/g, ''));
        
        if (sortType === 'asc') {
            return priceA - priceB; // Tăng dần
        } else {
            return priceB - priceA; // Giảm dần
        }
    });

    // Xóa dữ liệu cũ trên bảng và đắp các dòng đã sắp xếp vào lại
    tbody.innerHTML = '';
    rows.forEach(row => tbody.appendChild(row));
});