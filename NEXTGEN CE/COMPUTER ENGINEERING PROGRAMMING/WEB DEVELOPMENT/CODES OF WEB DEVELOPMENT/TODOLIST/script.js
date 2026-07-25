const taskForm=document.getElementById('task-form');
const taskInput=document.getElementById('taskInput');
const taskList=document.getElementById('task-list');
//Load tasks from localStorage
document.addEventListener('DOMContentLoaded',loadTasks);
taskForm.addEventListener('submit',function(e){
    e.preventDefault();
    addTask(taskInput.value);
    taskInput.value='';    
});
function addTask(task){
    if(taskText==='') return;
    const li=document.createElement('li');
    li.textContent=task;
    li.addEventListener('click',function(){
        li.classList.toggle('completed');
        saveTasks();
    });
    const deleteBtn=document.createElement('button');
    deleteBtn.textContent='Delete';
    deleteBtn.addEventListener('click',function(){
        li.remove();
        saveTasks();
    });
    li.appendChild(deleteBtn);
    taskList.appendChild(li);
    saveTasks();
}
function saveTasks(){
    const tasks=[];
    document.querySelectorAll('#task-list li').forEach(function(li){
        tasks.push({
            text:li.firstChild.textContent,
            completed:li.classList.contains('completed')
        });
    });
    localStorage.setItem('tasks',JSON.stringify(tasks));
}
function loadTasks(){
    const tasks=JSON.parse(localStorage.getItem('tasks'))||[];
    tasks.forEach(task=>{
        const li=document.createElement('li');
            li.textContent=task.text;
            if(task.completed){
                li.classList.add('completed');
            }
            li.addEventListener('click',function(){
                li.classList.toggle('completed');
                saveTasks();
            });
            const deleteBtn=document.createElement('button');
            deleteBtn.textContent='Delete';
            deleteBtn.addEventListener('click',function(){
                li.remove();
                saveTasks();
            });
            li.appendChild(deleteBtn);
            taskList.appendChild(li);   
        });
}