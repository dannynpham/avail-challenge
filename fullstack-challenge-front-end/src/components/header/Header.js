import React from "react"
import {
  Box,
  Stack,
} from "@rent_avail/layout"
import { Link } from "react-router-dom"
import {
  useHistory,
} from "react-router-dom"
import { destroySession } from "../../api/sessions"

const Header = () => {
  const history = useHistory()
  const logout = async () => {
    const logout = await destroySession()
    history.push("/")
  }
  return (
    <Stack bg="blue_500" color="blue_100" direction={["column", "row"]} spacing="0">
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
        <Link onClick={logout}>Logout</Link>
      </Box>
    </Stack>
  )
}

export default Header
