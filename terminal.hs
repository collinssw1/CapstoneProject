-- Terminal Emulator 
-- Capstone Program
-- Terminal

import System.IO
import System.Posix.Process
import System.Posix.Env
import System.Process
import System.Directory

-- Simple Main Method
main :: IO()
main = do
        inputcall <- uinput ">hash " 
        if inputcall then main else return()

-- Get the user input.
uinput :: String -> IO Bool
uinput prompt = do
    putStr $ prompt
    hFlush stdout
    str <- getLine
    case str of
        "exit"  -> return False
        _       -> finput (words str)

-- Case the user input
finput :: [String] -> IO Bool
finput (x:xs)
        | x == "clear"  = reset 
        | x == "pwd"    = prworkdir 
        | x == "ls"     = listDirec
        | x == "cd"     = changedir xs
        | x == "mkdir"  = imkdir xs
        | x == "rmdir"  = irmdir xs
        | x == "cp"     = icp xs
        | x == "rm"     = irm xs
        | x == "mv"     = imv xs
        | x == "more"   = imore xs
        | otherwise     = othercommand (x:xs)

-- Display some information about a file
imore :: [String] -> IO Bool
imore []     = do
        putStrLn("Error: You need to select a file to read more about it!")
        return True
imore (x:xs) = do
        file <- readFile x
        putStr file
        return True 

-- Remove a file
irm :: [String] -> IO Bool
irm []     = do
        putStrLn("Error: You must select a file to remove!")
        return True
irm (x:xs) = do
        removeFile x
        return True

-- Rename a file
imv :: [String] -> IO Bool
imv []     = do
        putStrLn("Error: You must select a name!")
        return True
imv (x:y:xs) = do
        renameFile x y
        return True

-- Copy a file
icp :: [String] -> IO Bool
icp []     = do
        putStrLn("Error: You must select a file to copy!")
        return True
icp (x:xs) = do
        copyFile x x
        return True

-- Make a directory
imkdir :: [String] -> IO Bool
imkdir []     = do
        putStrLn("Error: You must name a directory!")
        return True 
imkdir (x:xs) = do
        createDirectory x
        putStrLn("Success! " ++ x ++ " has been created")
        return True

-- Remove a directory
irmdir :: [String] -> IO Bool
irmdir []     = do
        putStrLn("Error: You must select a directory!")
        return True
irmdir (x:xs) = do
        removeDirectory x
        putStrLn("Success! " ++ x ++ " has been removed")
        return True

-- Reset the window
reset :: IO Bool
reset = do
        _ <- System.Process.system "reset"
        return True

-- Print the working directory
prworkdir :: IO Bool
prworkdir = do
        pwd <- getCurrentDirectory
        print pwd
        return True

-- Read the help file and print the commands
help :: IO Bool
help = do
        putStrLn("Here's the help command that has yet to implemented")
        return True

-- List the Current Directory Contents
listDirec :: IO Bool
listDirec = do
        pwd <- getCurrentDirectory
        cdr <- getDirectoryContents pwd
        mapM_ putStrLn cdr
        return True

-- Other Commands (that may or may not be cheating)
othercommand :: [String] -> IO Bool
othercommand (x:xs) = do
        rawSystem x xs
        return True

-- Change the Current Directory
changedir :: [String] -> IO Bool
changedir []     = do
        putStrLn("Error: You must select a directory!")
        return True
changedir (x:xs) = do
        setCurrentDirectory x
        return True

-- Print that there exists an error
ierror :: String -> IO Bool
ierror str = do
        putStrLn("Error: " ++ str ++ " hasn't been implemented")
        return True

-- Here Lies Forking Command
-- May he rest his soul until I can figure out how to
-- ressurect him.
-- forkProcess comes with a giant warning: since any other 
-- running threads are not copied into the child process, it's easy to go wrong: 
-- e.g. by accessing some shared resource that was held by another thread in the parent.
