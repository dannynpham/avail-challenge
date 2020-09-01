import React, { useEffect, useState } from "react"
import { Text } from "@rent_avail/typography"
import { getUsers } from "../api/users"

const Users = () => {
  const [error, setError] = useState(null)
  const [users, setUsers] = useState(null)
  const [loading, setLoading] = useState(false)

  const fetchUsers = async () => {
    setLoading(true)
    const data = await getUsers()
    if (data.error) {
      setError(data.error)
    } else {
      setUsers(data.users)
    }
    setLoading(false)
  }

  useEffect(() => {
    fetchUsers()
  }, [])

  if (loading) {
    return <div>Loading...</div>
  }

  if (error) {
    return <Text>{error}</Text>
  }

  return (
    <div>
      <ul>
        {(users || []).map((user) => (
          <li key={user.id}>{user.name}</li>
        ))}
      </ul>
    </div>
  )
}

export default Users
