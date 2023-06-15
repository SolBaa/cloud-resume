const counter = document.getElementById('footer');
async function getCounter() {
    let response = await fetch('https://8l4f7ynm1a.execute-api.us-east-1.amazonaws.com/dev');
    let data = await response.json();
    console.log(data.body);
    counter.innerHTML = `<p>${data.body}<p>`;
}

getCounter();