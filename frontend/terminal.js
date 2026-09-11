const output = document.getElementById("output");
const input = document.getElementById("command-input");

function appendLines(text, className) {
  const lines = text.replace(/\r\n/g, "\n").split("\n");
  for (const line of lines) {
    const div = document.createElement("div");
    if (className) div.className = className;
    div.textContent = line;
    output.appendChild(div);
  }
  output.scrollTop = output.scrollHeight;
}

function connect() {
  const protocol = location.protocol === "https:" ? "wss:" : "ws:";
  const socket = new WebSocket(`${protocol}//${location.host}/ws/game`);

  socket.addEventListener("open", () => {
    input.disabled = false;
    input.focus();
  });

  socket.addEventListener("message", (event) => {
    appendLines(event.data);
  });

  socket.addEventListener("close", () => {
    appendLines("Connection closed.", "error");
    input.disabled = true;
  });

  socket.addEventListener("error", () => {
    appendLines("Connection error.", "error");
  });

  input.addEventListener("keydown", (event) => {
    if (event.key !== "Enter") return;
    const command = input.value;
    if (!command || socket.readyState !== WebSocket.OPEN) return;
    socket.send(command);
    input.value = "";
  });
}

connect();
