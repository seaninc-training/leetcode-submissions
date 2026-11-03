class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        
        list1 = list(word1)
        list2 = list(word2)
        length1 = len(list1)
        length2 = len(list2)
        merged_list = []

        if length1 == length2:
            for i in range(length1):
                merged_list.append(list1[i])
                merged_list.append(list2[i])
        elif length1 > length2:
            for i in range(length2):
                merged_list.append(list1[i])
                merged_list.append(list2[i])
            
            merged_list.append(''.join(list1[i+1:]))
        else:
            for i in range(length1):
                merged_list.append(list1[i])
                merged_list.append(list2[i])
            
            merged_list.append(''.join(list2[i+1:]))
        
        merged_word = ''.join(merged_list)
        return merged_word