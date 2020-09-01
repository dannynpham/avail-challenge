import Home from "./pages/Home"
import Login from "./pages/Login"
import Signup from "./pages/Signup"
import Users from "./pages/Users"

const routes = [
  {
    path: "/",
    component: Home,
  },
  {
    path: "/login",
    component: Login,
  },
  {
    path: "/signup",
    component: Signup,
  },
  {
    path: "/users",
    component: Users,
  },
]

export default routes
