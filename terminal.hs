-- Sebastian Collins
-- Capstone Project
-- Functional Programmming Shell
-- Programming was a mistake. This entire field is nothing but trash.


-- Imports
import System.IO
import System.Process
-- import System.POSIX
import System.Directory
-- import System.Console.Rainbow

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
            str2 <- setCurrentDirectory str
            print str2
            return True
        
        -- List Directory 
        "ls"    -> do
            putStrLn "cd has not been implemented"
            return True 
        -- Clear Command
        "clear" -> do
            -- str2 <- clearScreen
            _ <- System.Process.system "reset"
            return True
        
        -- Move Command
        "mv"    -> do
            putStrLn "mv has not been implemented"
            return True

        -- Manual Page (After Cild Process)
        "man"    -> do
            putStrLn "man has not been implemented"
            return True

        -- Make Directory
        "mkdir"    -> do
            putStrLn "mkdir has not been implemented"
            return True

        -- Remove Directory
        "rmdir"    -> do
            putStrLn "rmdir has not been implemented"
            return True

        -- Touch
        "touch"    -> do
            putStrLn "touch has not been implemented"
            return True

        -- Locate
        "locate"    -> do
            putStrLn "locate has not been implemented"
            return True

        -- Printing Working Directory
        "pwd"   -> do
            str2 <- getCurrentDirectory 
            print str2
            return True        
   
        -- Demo the Color Properties
        -- "color" -> do
                 
        -- Unknown Function
        _       -> do 
            putStrLn ("ERROR: " ++ str ++ " is not a valid command")
            userInput prompt


-- Background Processes

-- Check Child Process
-- childProcess :: String -> IO 
-- Taking a break as this stuff is incredibly infuriating
-- Trying to find the Process ID is like Rocket Science
-- Trying to kill is it performing brain surgery in space
-- and trying to reap the dead ones is like trying to find an honest politician.




-- Store Commands (Remembering Commands)
-- Desc. : On the up arrow, retrieve the previous command.
--
-- pastCommands ::  [String]
-- pastCommands [] = print ""
-- pastCommands  x = print x
-- pastCommands (x:xs) = print x + print pastCommands xs

-- Executing another program


-- Haskell Color Support
--


