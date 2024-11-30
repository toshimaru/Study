from typing import List, Optional

class TreeNode:
    def __init__(self, key, val):
        self.key = key
        self.val = val
        self.left = None
        self.right = None

class TreeMap:
    def __init__(self):
        self.root = None

    def insert(self, key: int, val: int) -> None:
        newNode = TreeNode(key, val)
        if self.root == None:
            self.root = newNode
            return

        curr = self.root
        while True:
            if key < curr.key:
                if curr.left == None:
                    curr.left = newNode
                    return
                curr = curr.left
            elif key > curr.key:
                if curr.right == None:
                    curr.right = newNode
                    return
                curr = curr.right
            else:
                curr.val = val
                return

    def get(self, key: int) -> int:
        curr = self.root
        while curr:
            if key < curr.key:
                curr = curr.left
            elif key > curr.key:
                curr = curr.right
            else:
                return curr.val
        return -1

    def getMin(self) -> int:
        curr = self.findMin(self.root)
        return curr.val if curr else -1

    def getMax(self) -> int:
        curr = self.root
        if not curr:
            return -1
        while curr.right:
            curr = curr.right
        return curr.val

    def remove(self, key: int) -> None:
        self.root = self.removeHelper(self.root, key)
        return

    # Remove the node with key, return the new root of the subtree
    def removeHelper(self, curr, key: int) -> Optional[TreeNode]:
        if not curr:
            return None
        if key < curr.key:
            curr.left = self.removeHelper(curr.left, key)
        elif key > curr.key:
            curr.right = self.removeHelper(curr.right, key)
        else:
            if not curr.left:
                return curr.right
            if not curr.right:
                return curr.left
            minNode = self.findMin(curr.right)
            curr.key = minNode.key
            curr.val = minNode.val
            curr.right = self.removeHelper(curr.right, minNode.key)
        return curr

    def findMin(self, node):
        while node and node.left:
            node = node.left
        return node

    def getInorderKeys(self) -> List[int]:
        result = []
        self.inorderTraversal(self.root, result)
        return result

    def inorderTraversal(self, root, result):
        if root:
            self.inorderTraversal(root.left, result)
            result.append(root.key)
            self.inorderTraversal(root.right, result)
        return
