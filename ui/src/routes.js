import Home from "./pages/Home"
import Login from "./pages/Login"
import Signup from "./pages/Signup"
import TwoFactor from "./pages/TwoFactor"
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
    path: "/two-factor",
    component: TwoFactor,
  },
  {
    path: "/users",
    component: Users,
  },
]

export default routes
