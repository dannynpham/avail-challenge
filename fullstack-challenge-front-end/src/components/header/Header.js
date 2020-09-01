import React from "react"
import { Box, Stack } from "@rent_avail/layout"
import { Link, useHistory } from "react-router-dom"
import { Button } from "@rent_avail/controls"

import { destroySession } from "../../api/sessions"

const Header = () => {
  const history = useHistory()

  const logout = async () => {
    await destroySession()
    history.push("/")
  }
  return (
    <Stack
      bg="blue_500"
      color="blue_100"
      direction={["column", "row"]}
      spacing="0"
      alignItems="center"
    >
      <Box p="2rem">
        <Link to="/">Home</Link>
      </Box>
      <Box p="2rem">
        <Link to="/login">Login</Link>
      </Box>
      <Box p="2rem">
        <Link to="/signup">Signup</Link>
      </Box>
      <Box p="2rem">
        <Link to="/users">Users</Link>
      </Box>
      <Box p="2rem">
        <Button variant="danger" onClick={logout}>
          Logout
        </Button>
      </Box>
    </Stack>
  )
}

export default Header
