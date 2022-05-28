import React from "react"
import { useForm } from "react-hook-form"
import { Stack, Flex, Box } from "@rent_avail/layout"
import { Button, Checkbox } from "@rent_avail/controls"
import { Text } from "@rent_avail/typography"
import Input from "@rent_avail/input"
import { useHistory } from "react-router-dom"
import { createSession } from "../../api/sessions"

const LoginForm = () => {
  const history = useHistory()
  const { handleSubmit, register, errors, setError, formState } = useForm()

  const onSubmit = async (values) => {
    try {
      const data = await createSession(values)
      if (data && data.error) {
        setError("password", {
          type: "manual",
          message: data.error,
        })
      } else {
        history.push("/two-factor")
      }
    } catch (err) {
      console.error("Error:", err)
    }
  }

  return (
    <Stack>
      <form onSubmit={handleSubmit(onSubmit)}>
        <Input
          label="Email"
          name="email"
          type="email"
          ref={register({
            required: "Required",
            pattern: {
              value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
              message: "invalid email address",
            },
          })}
        />
        {errors.email && (
          <Text color="red" pt={2}>
            {errors.email.message}
          </Text>
        )}

        <Input
          mt={2}
          label="Password"
          type="password"
          name="password"
          ref={register()}
        />
        {errors.password && (
          <Text color="red" pt={2}>
            {errors.password.message}
          </Text>
        )}

        <Flex alignItems="center" justifyContent="space-between">
          <Button mt={2} loading={formState.isSubmitting} type="submit">
            Submit
          </Button>
          <Flex alignItems="center">
            <Box mr={1}>
              Remember Device
            </Box>
            <Checkbox
              type="remember_device"
              name="remember_device"
              ref={register()}
            />
          </Flex>
        </Flex>
      </form>
    </Stack>
  )
}

export default LoginForm
