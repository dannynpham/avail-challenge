import URL from "./index"

const createSession = (values) =>
  new Promise((resolve, reject) => {
    fetch(`${URL}/sessions`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ session: values }),
    })
      .then((response) => response.json())
      .then((data) => {
        resolve(data)
      })
      .catch((error) => {
        reject(error)
      })
  })

const destroySession = () =>
  new Promise((resolve, reject) => {
    fetch(`${URL}/sessions`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((response) => response.json())
      .then((data) => {
        resolve(data)
      })
      .catch((error) => {
        reject(error)
      })
  })

export { createSession, destroySession }
