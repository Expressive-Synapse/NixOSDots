const date = Variable('',{
  poll: [1000, `date +'%l:%M %p'`],
});

export const clock = () => Widget.Label({ label: date.bind(),
  className: 'clock'})

