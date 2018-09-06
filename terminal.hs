-- Sebastian Collins
-- Capstone Project
-- Functional Programmming Shell
-- Programming was a mistake. This entire field is nothing but trash.



-- Imports
import System.IO


-- Simple Main Method
main :: IO()
main = do
        -- Get the userInput
        inputCall <- userInput ">hash "
        -- If statement loop. If the function returns true, then you continue looping, otherwise you exit the terminal.
        if inputCall then main else return()


-- User Input String Parsing
userInput :: String -> IO Bool
userInput prompt = do
    -- Display a prompt, waiting for a user input
    putStr $ prompt
    hFlush stdout
    -- Put the User input inside of the str variable
    str <- getLine
    case str of
        -- Correctly exit the program
        "exit"  -> return False
        -- Change Directory
        "cd"    -> do
            putStrLn "cd has not been implemented"
            return True
        -- List Directory
        "ls"    -> do
            putStrLn "ls has not been implemented"
            return True
        -- Unknown Function
        _       -> do 
            putStrLn ("ERROR: " ++ str ++ "is not a valid command")
            userInput prompt
